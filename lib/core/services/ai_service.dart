import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_contants.dart';

class AiService {
  Future<List<String>> generateQuestions({
    required String role,
    required String industry,
    int count = 5,
  }) async {
    try {
    

      final response = await http.post(
        Uri.parse(AppConstants.groqApiUrl),
        headers: {
          'Authorization': 'Bearer ${AppConstants.groqApiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': AppConstants.groqModel,
          'messages': [
            {
              'role': 'system',
              'content': 'You are a senior technical interviewer.',
            },
            {
              'role': 'user',
              'content': '''
Generate exactly $count interview questions for a $role position in the $industry industry.

Rules:
- Questions must be technical and relevant to the role
- Mix of conceptual and practical questions
- Each question on a new line
- No numbering or bullets
- No extra text, just the questions

Generate the questions now:
''',
            }
          ],
          'max_tokens': 1000,
          'temperature': 0.7,
        }),
      );

    

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['choices'][0]['message']['content'] as String;
   

        final questions = text
            .split('\n')
            .where((q) => q.trim().isNotEmpty)
            .take(count)
            .toList();

        return questions;
      } else {
   
        return _fallbackQuestions(role);
      }
    } catch (e) {

      return _fallbackQuestions(role);
    }
  }

  Future<Map<String, dynamic>> analyzeInterview({
    required String role,
    required List<String> questions,
    required List<String> answers,
  }) async {
    try {
      final qaPairs = List.generate(
        questions.length,
        (i) => 'Q: ${questions[i]}\nA: ${answers[i]}',
      ).join('\n\n');

      final response = await http.post(
        Uri.parse(AppConstants.groqApiUrl),
        headers: {
          'Authorization': 'Bearer ${AppConstants.groqApiKey}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'model': AppConstants.groqModel,
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a very strict and experienced senior technical interviewer at a top tech company.',
            },
            {
              'role': 'user',
              'content': '''
Analyze this $role interview honestly and critically.

Interview transcript:
$qaPairs

Scoring rules:
- Score 0-30: Poor answers, no technical knowledge shown
- Score 31-50: Below average, vague or incorrect answers
- Score 51-70: Average, some knowledge but lacks depth
- Score 71-85: Good, solid answers with good understanding
- Score 86-100: Excellent, deep knowledge and clear communication

Important rules:
- Be very strict and honest
- If answers are vague, generic or too short give low score
- If candidate clearly does not know the answer score it very low
- Do not give benefit of doubt
- A simulated or fake answer should score below 30
- Only reward genuine technical knowledge

Provide your analysis in this exact format:
SCORE: [number between 0-100]
STRENGTHS: [3 short bullet points separated by |]
IMPROVEMENTS: [3 short bullet points separated by |]
SUGGESTIONS: [3 short bullet points separated by |]

Only respond in the format above nothing else.
''',
            }
          ],
          'max_tokens': 1000,
          'temperature': 0.3,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['choices'][0]['message']['content'] as String;
      
        return _parseAnalysis(text);
      } else {
      
        return _fallbackAnalysis();
      }
    } catch (e) {
   
      return _fallbackAnalysis();
    }
  }

  Map<String, dynamic> _parseAnalysis(String text) {
    try {
      final lines =
          text.split('\n').where((l) => l.trim().isNotEmpty).toList();

      int score = 50;
      List<String> strengths = [];
      List<String> improvements = [];
      List<String> suggestions = [];

      for (final line in lines) {
        if (line.startsWith('SCORE:')) {
          score = int.tryParse(
                line.replaceAll('SCORE:', '').trim(),
              ) ??
              50;
        } else if (line.startsWith('STRENGTHS:')) {
          strengths = line
              .replaceAll('STRENGTHS:', '')
              .trim()
              .split('|')
              .map((s) => s.trim())
              .toList();
        } else if (line.startsWith('IMPROVEMENTS:')) {
          improvements = line
              .replaceAll('IMPROVEMENTS:', '')
              .trim()
              .split('|')
              .map((s) => s.trim())
              .toList();
        } else if (line.startsWith('SUGGESTIONS:')) {
          suggestions = line
              .replaceAll('SUGGESTIONS:', '')
              .trim()
              .split('|')
              .map((s) => s.trim())
              .toList();
        }
      }

      return {
        'score': score,
        'strengths': strengths,
        'improvements': improvements,
        'suggestions': suggestions,
      };
    } catch (e) {
      return _fallbackAnalysis();
    }
  }

  List<String> _fallbackQuestions(String role) {
    return [
      'Tell me about yourself and your experience as a $role.',
      'What are your strongest technical skills?',
      'Describe a challenging project you worked on.',
      'How do you handle tight deadlines?',
      'Where do you see yourself in 5 years?',
    ];
  }

  Map<String, dynamic> _fallbackAnalysis() {
    return {
      'score': 50,
      'strengths': [
        'Good communication skills',
        'Relevant experience',
        'Positive attitude',
      ],
      'improvements': [
        'Need more technical depth',
        'Provide more specific examples',
        'Work on confidence',
      ],
      'suggestions': [
        'Practice mock interviews regularly',
        'Study core concepts deeply',
        'Work on real world projects',
      ],
    };
  }

  List<String> getFallbackQuestions(String role) {
    return _fallbackQuestions(role);
  }
}