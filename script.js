console.log("Copyright (c) 2026 WinSoft-Ltd");

document.addEventListener('DOMContentLoaded', function() {
    const lightThemeBtn = document.getElementById('light-theme');
    const darkThemeBtn = document.getElementById('dark-theme');
    const htmlElement = document.getElementById('html-theme');

    const savedTheme = localStorage.getItem('theme') || 'dark';
    setTheme(savedTheme);

    lightThemeBtn.addEventListener('click', () => {
        setTheme('light');
    });

    darkThemeBtn.addEventListener('click', () => {
        setTheme('dark');
    });

    function setTheme(theme) {
        htmlElement.setAttribute('data-theme', theme);

        localStorage.setItem('theme', theme);

        updateActiveButtons(theme);
    }

    function updateActiveButtons(activeTheme) {
        [lightThemeBtn, darkThemeBtn].forEach(btn => {
            btn.classList.remove('active');
        });

        if (activeTheme === 'light') {
            lightThemeBtn.classList.add('active');
        } else {
            darkThemeBtn.classList.add('active');
        }
    }

    const blocks = document.querySelectorAll('.block');
    blocks.forEach((block, index) => {
        block.style.opacity = '0';
        block.style.transform = 'translateY(20px)';

        setTimeout(() => {
            block.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
            block.style.opacity = '1';
            block.style.transform = 'translateY(0)';
        }, 300 + index * 200);
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
