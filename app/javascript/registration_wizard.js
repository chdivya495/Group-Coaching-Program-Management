document.addEventListener("DOMContentLoaded", function() {
  document.getElementById("next-step").addEventListener("click", function() {
    document.getElementById("step-1").style.display = "none";
    document.getElementById("step-2").style.display = "block";
  });

  const programSearchInput = document.getElementById("program-search-input");
  programSearchInput.addEventListener("input", function() {
    const searchTerm = programSearchInput.value;

    if (searchTerm.length > 2) { 
      fetch(`/coaches/search_by_program?name=${encodeURIComponent(searchTerm)}`)
        .then(response => response.json())
        .then(data => {
          if (data.error) {
            alert(data.error);
          } else {
            const detailsDiv = document.getElementById('search-results');
            const resultHtml = `
              <h2>Program: ${data.program.name}</h2>
              <h3>Enrolled Employees:</h3>
              <ul>
                ${data.employees.map(employee => `<li>${employee.first_name} ${employee.last_name}</li>`).join('')}
              </ul>
              <h3>Company: ${data.company.name}</h3>
            `;
            detailsDiv.innerHTML = resultHtml;
          }
        })
        .catch(error => {
          alert('Error fetching program details: ' + error);
        });
    }
  });

  const companySearchInput = document.getElementById("company-search-input");
  companySearchInput.addEventListener("input", function() {
    const searchTerm = companySearchInput.value;

    if (searchTerm.length > 2) {
      fetch(`/coaches/search_by_company?name=${encodeURIComponent(searchTerm)}`)
        .then(response => response.json())
        .then(data => {
          if (data.error) {
            alert(data.error);
          } else {
            const detailsDiv = document.getElementById('search-results');
            const resultHtml = `
              <h2>Company: ${data.company.name}</h2>
              <h3>Coaching Program: ${data.program.name}</h3>
              <h3>Enrolled Employees:</h3>
              <ul>
                ${data.employees.map(employee => `<li>${employee.first_name} ${employee.last_name}</li>`).join('')}
              </ul>
            `;
            detailsDiv.innerHTML = resultHtml;
          }
        })
        .catch(error => {
          alert('Error fetching company details: ' + error);
        });
    }
  });
});
