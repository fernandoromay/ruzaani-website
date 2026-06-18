// Marketing Efficiency Audit Logic
(function () {
  let currentQuestion = 0;
  const totalQuestions = window.auditTotalQuestions || 6;
  const answers = {};

  window.startAudit = function () {
    const intro = document.getElementById('audit-intro');
    if (intro) intro.style.display = 'none';
    
    const progress = document.getElementById('audit-progress');
    if (progress) progress.style.display = 'flex';
    
    showQuestion(1);
  };

  window.showQuestion = function (questionNum) {
    // Hide all questions
    document.querySelectorAll('.audit-question').forEach(q => {
      q.classList.remove('active');
    });

    // Show target question
    const question = document.getElementById(`question-${questionNum}`);
    if (question) {
      question.classList.add('active');
      currentQuestion = questionNum;
      updateProgress(questionNum);

      // --- Granular Tracking Start ---
      if (window.RuzaaniTracker) {
        window.RuzaaniTracker.track('evaluation_step_view', {
            step: questionNum,
            total: totalQuestions
        });
      }
      // --- Granular Tracking End ---
    }
  };

  function updateProgress(questionNum) {
    document.querySelectorAll('.progress-step').forEach((step, index) => {
      const stepNum = index + 1;
      step.classList.remove('active', 'completed');

      if (stepNum === questionNum) {
        step.classList.add('active');
      } else if (stepNum < questionNum) {
        step.classList.add('completed');
      }
    });
  }

  window.nextQuestion = function (current) {
    if (current < totalQuestions) {
      showQuestion(current + 1);
    }
  };

  window.previousQuestion = function (current) {
    if (current > 1) {
      showQuestion(current - 1);
    }
  };

  window.showContactModal = function() {
      // Use Bootstrap modal API
      const el = document.getElementById('contactModal');
      const modal = new bootstrap.Modal(el);
      modal.show();
  };

  // Inject hidden inputs for questions before submission
  document.getElementById('audit-form')?.addEventListener('submit', function (e) {
    // --- Granular Tracking Start ---
    if (window.RuzaaniTracker) {
        window.RuzaaniTracker.track('evaluation_submit_start', {
            date: new Date().toISOString()
        });
    }
    // --- Granular Tracking End ---

    const form = e.target;

    for (const [key, value] of Object.entries(answers)) {
        if (key.startsWith('question-')) {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = key;
            input.value = value;
            form.appendChild(input);
        }
    }
  });

  // Contact Form Validation
  const contactInputs = document.querySelectorAll('.contact-form input');
  const finalSubmitBtn = document.getElementById('btn-final-submit');

  function validateContactForm() {
    if (!finalSubmitBtn) return;
    
    const name = document.getElementById('contact-name').value.trim();
    const company = document.getElementById('contact-company').value.trim();
    const email = document.getElementById('contact-email').value.trim();
    const role = document.getElementById('contact-role').value.trim();

    // Basic validation
    const isValid = name.length > 0 && 
                    company.length > 0 && 
                    email.includes('@') && email.length > 5 &&
                    role.length > 0;

    finalSubmitBtn.disabled = !isValid;
  }

  contactInputs.forEach(input => {
    input.addEventListener('input', validateContactForm);
  });

  // Event delegation for option selection
  document.addEventListener('click', function (e) {
    const optionCard = e.target.closest('.option-card');
    if (!optionCard) return;

    const questionDiv = optionCard.closest('.audit-question');
    const questionNum = parseInt(questionDiv.dataset.question);
    const input = optionCard.querySelector('input[type="radio"]');
    const questionId = `question-${questionNum}`;
    const value = input.value;

    // Save answer (use question index as key for backend)
    answers[questionId] = value;

    // --- Granular Tracking Start ---
    if (window.RuzaaniTracker) {
        window.RuzaaniTracker.track('evaluation_option_selected', {
            question: questionNum,
            value: value
        });
    }
    // --- Granular Tracking End ---

    // Update UI
    questionDiv.querySelectorAll('.option-card').forEach(card => {
      card.classList.remove('selected');
    });
    optionCard.classList.add('selected');
    input.checked = true;

    // Enable next button
    const nextBtn = document.getElementById(`next-btn-${questionNum}`);
    if (nextBtn) {
      nextBtn.disabled = false;
    }

    // Automatic advancement (if not the last question)
    if (questionNum < totalQuestions) {
      setTimeout(() => {
        nextQuestion(questionNum);
      }, 400); // Small delay to show selection
    }
  });

})();

/**
 * Process Steps Animation
 * Sequentially highlights steps to guide user attention
 */
document.addEventListener('DOMContentLoaded', function() {
    const steps = document.querySelectorAll('.process-step-number');
    if (steps.length < 4) return;

    // Timeline (ms)
    // Step 1: 0 - 2000
    // Wait: 2000 - 3000
    // Step 2: 3000 - 5000
    // Wait: 5000 - 6000
    // Step 3: 6000 - 8000
    // Wait: 8000 - 9000
    // Step 4: 9000+

    // Step 1
    setTimeout(() => steps[0].classList.add('active'), 1000); // Slight initial delay
    setTimeout(() => steps[0].classList.remove('active'), 3000);

    // Step 2
    setTimeout(() => steps[1].classList.add('active'), 4500);
    setTimeout(() => steps[1].classList.remove('active'), 6500);

    // Step 3
    setTimeout(() => steps[2].classList.add('active'), 8000);
    setTimeout(() => steps[2].classList.remove('active'), 10000);

    // Step 4 (Stays active)
    setTimeout(() => steps[3].classList.add('active'), 11500);
});
