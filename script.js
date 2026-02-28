console.log("Copyright (c) 2026 WinSoft-Ltd");

document.addEventListener('DOMContentLoaded', function() {
    const blocks = document.querySelectorAll('.block');
    blocks.forEach((block, index) => {
        block.style.opacity = '0';
        block.style.transform = 'translateY(30px) rotateX(-10deg)';

        setTimeout(() => {
            block.style.transition = 'opacity 0.8s ease, transform 0.8s cubic-bezier(0.23, 1, 0.32, 1)';
            block.style.opacity = '1';
            block.style.transform = 'translateY(0) rotateX(0)';
        }, 200 + index * 150);
    });

    document.addEventListener('mousemove', (e) => {
        const blocks = document.querySelectorAll('.block');
        const xAxis = (window.innerWidth / 2 - e.pageX) / 50;
        const yAxis = (window.innerHeight / 2 - e.pageY) / 50;

        blocks.forEach(block => {
            block.style.transform = `translateY(${yAxis}px) rotateX(${yAxis * 0.5}deg) translateX(${xAxis}px)`;
        });
    });

    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'center'
                });
            }
        });
    });
});
