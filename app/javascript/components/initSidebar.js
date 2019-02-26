const initSidebar = () => {
  const sidebarCollapse = document.getElementById('sidebarCollapse');
  sidebarCollapse.addEventListener('click', (event) => {
    const sidebar = document.getElementById('sidebar');
    sidebar.classList.toggle('active');
  });
};

export { initSidebar };
