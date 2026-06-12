document.addEventListener('DOMContentLoaded', () => {
    const toggle = document.getElementById('navToggle');
    const overlay = document.getElementById('navOverlay');

    if (toggle && overlay) {
        toggle.addEventListener('click', () => {
            overlay.classList.toggle('open');
        });
    }
});

/**
 * Scroll behavior for navbar and menu toggle
 * Desktop: Navbar hides on scroll down, toggle appears
 * Mobile: Always show toggle, navbar always hidden
 */

let lastScrollTop = 0;
let navbar = null;
let menuToggle = null;
let scrollThreshold = 100;

function init() {
    navbar = document.querySelector('.navbar-top');
    menuToggle = document.querySelector('.menu-toggle');

    if (!navbar || !menuToggle) return;

    // Only add scroll behavior on desktop
    if (window.innerWidth >= 992) {
        window.addEventListener('scroll', handleScroll);
    }

    // Re-initialize on resize
    window.addEventListener('resize', function () {
        if (window.innerWidth >= 992) {
            window.addEventListener('scroll', handleScroll);
        } else {
            window.removeEventListener('scroll', handleScroll);
            // Reset states for mobile
            if (navbar) navbar.classList.remove('hidden');
            if (menuToggle) menuToggle.classList.remove('visible');
        }
    });
}

function handleScroll() {
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > scrollThreshold) {
        // User has scrolled past threshold
        if (scrollTop > lastScrollTop) {
            // Scrolling down - hide navbar, show toggle
            if (navbar) navbar.classList.add('hidden');
            if (menuToggle) menuToggle.classList.add('visible');
        }
    } else {
        // At top of page - show navbar, hide toggle
        if (navbar) navbar.classList.remove('hidden');
        if (menuToggle) menuToggle.classList.remove('visible');
    }

    lastScrollTop = scrollTop <= 0 ? 0 : scrollTop;
}

// Initialize on DOM ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
} else {
    init();
}

/**
 * Global Scroll Reveal Animation
 * Triggers when .reveal elements enter/exit the viewport
 */
document.addEventListener('DOMContentLoaded', () => {
    const revealObs = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            } else {
                entry.target.classList.remove('visible');
            }
        });
    }, { threshold: 0.12 });

    const observeNewElements = (root) => {
        root.querySelectorAll('.reveal').forEach(el => revealObs.observe(el));
    };

    // Initial observation
    observeNewElements(document);

    // Watch for dynamically added .reveal elements
    const mutationObs = new MutationObserver((mutations) => {
        mutations.forEach(mutation => {
            mutation.addedNodes.forEach(node => {
                if (node.nodeType === 1) { // Element
                    if (node.classList.contains('reveal')) {
                        revealObs.observe(node);
                    }
                    observeNewElements(node);
                }
            });
        });
    });

    mutationObs.observe(document.body, { childList: true, subtree: true });
});
