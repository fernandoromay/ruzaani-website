document.addEventListener('DOMContentLoaded', () => {

    // Displacement hover
    const items = document.querySelectorAll('.displacement-item');

    function activateItem(index) {
        // Find all related elements for this section
        const items = document.querySelectorAll('.displacement-item');
        const animations = document.querySelectorAll('.disp-animation');

        // Reset all
        items.forEach(i => i.classList.remove('active'));
        animations.forEach(a => a.classList.remove('active'));

        // Set active states by index matching
        const targetItem = document.querySelector(`.displacement-item[data-index="${index}"]`);
        const targetAnim = document.querySelector(`.disp-animation[data-index="${index}"]`);

        if (targetItem) targetItem.classList.add('active');
        if (targetAnim) targetAnim.classList.add('active');
    }

    items.forEach(item => {
        const index = item.getAttribute('data-index');
        item.addEventListener('mouseenter', () => activateItem(index));
    });

    // Initial activation
    const firstItem = document.querySelector('.displacement-item');
    if (firstItem) activateItem(firstItem.getAttribute('data-index'));
});