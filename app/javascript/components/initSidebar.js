const initSidebar = () => {
  const sidebarCollapse = document.getElementById('sidebarCollapse');
  sidebarCollapse.addEventListener('click', (event) => {
    const content = document.getElementById('content');
    content.classList.toggle('disabled-div')
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('active');
  });
};

export { initSidebar };
