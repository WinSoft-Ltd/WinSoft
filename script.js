console.log("Сайт работает нормально!");

const modal = document.getElementById('myModal');
const btnOpen = document.getElementById('openModal');
const closeBtn = document.getElementById('closeModal');

btnOpen.addEventListener('click', () => {
  modal.classList.add('show');
});

closeBtn.addEventListener('click', () => {
  modal.classList.remove('show');
});

modal.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.classList.remove('show');
  }
});
