import 'package:bloc_test/bloc_test.dart';
import 'package:collaction_app/application/contact_form/contact_form_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'contact_form_fixture.dart';

void main() {
  group('Testing Contact Form BLoC', () {
    test('Initial ContactForm BLoC state', () {
      expect(tContactFormBloc.state, const ContactFormState.initial());
    });

    {
      when(() => tContactFormApi.sendContactFormContents(tContactFormDtoS))
          .thenAnswer((_) => Future.value(right(unit)));
      blocTest(
        'Testing submit event success',
        build: () => ContactFormBloc(tContactFormApi),
        act: (ContactFormBloc bloc) {
          bloc.add(ContactFormEvent.submitted(tContactFormDtoS));
        },
        expect: () => [
          const ContactFormState.submitting(),
          const ContactFormState.submissionSuccessful(),
        ],
      );
    }
  });
}
