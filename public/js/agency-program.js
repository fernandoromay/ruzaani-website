/**
 * agency-program.js
 * Handles: Tab switching (Section 3 payload), counter animation (Section 4)
 */

document.addEventListener('DOMContentLoaded', () => {

    /* ── Tab / Displacement (Section 3 — The Payload) ────────────── */

    const agencyTabs   = document.querySelectorAll('.agency-tab');
    const agencyPanels = document.querySelectorAll('.agency-panel');

    function activateTab(index) {
        agencyTabs.forEach((t, i) => t.classList.toggle('active', i === index));
        agencyPanels.forEach((p, i) => {
            p.classList.remove('active');
            if (i === index) {
                // tiny delay so the fade-out can clear first
                setTimeout(() => p.classList.add('active'), 20);
            }
        });
    }

    agencyTabs.forEach((tab, i) => {
        tab.addEventListener('click', () => activateTab(i));
    });

    // activate first tab on load
    if (agencyTabs.length) activateTab(0);


    /* ── Counter Animation (Section 4 — Scale Engine) ─────────────── */
    const counters = document.querySelectorAll('[data-count]');

    const easeOutQuart = t => 1 - Math.pow(1 - t, 4);

    function animateCounter(el) {
        const target   = parseFloat(el.dataset.count);
        const duration = 1600; // ms
        const isFloat  = el.dataset.count.includes('.');
        const suffix   = el.dataset.suffix || '';
        const prefix   = el.dataset.prefix || '';
        const start    = performance.now();

        function update(now) {
            const elapsed  = now - start;
            const progress = Math.min(elapsed / duration, 1);
            const eased    = easeOutQuart(progress);
            const current  = target * eased;

            el.textContent = prefix + (isFloat ? current.toFixed(1) : Math.round(current)) + suffix;

            if (progress < 1) requestAnimationFrame(update);
        }

        requestAnimationFrame(update);
    }

    // Fire counters when Section 4 enters the viewport
    const scaleSection = document.querySelector('.scale-engine-section');
    if (scaleSection && counters.length) {
        let hasAnimated = false;
        const obs = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    if (!hasAnimated) {
                        counters.forEach(animateCounter);
                        hasAnimated = true;
                    }
                } else {
                    hasAnimated = false; // reset so it can re-animate
                }
            });
        }, { threshold: 0.25 });

        obs.observe(scaleSection);
    }

    /* ── Comparison Rows (Section 2) stagger in on scroll ─────── */
    const compRows = document.querySelectorAll('.comp-row');
    if (compRows.length) {
        const compObs = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                } else {
                    entry.target.classList.remove('visible');
                }
            });
        }, { threshold: 0.1 });

        compRows.forEach(row => compObs.observe(row));
    }

});
