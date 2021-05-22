console.log("js loaded...")
const input = document.getElementById('new-course-input')
const courseNames = {}
Array.from(input.options).forEach(option => courseNames[option.value] = option.text)
const newCourseTypeIds = document.getElementById('new-course-type-ids')
const table = document.getElementById('new-course-table-body')
const button = document.getElementById('new-course-button')
button.addEventListener('click', addCourse)

function addCourse() {
    newCourseTypeIds.value += ' ' + input.value
    const row = document.createElement('tr')
    table.appendChild(row)
    const td = document.createElement('td')
    td.textContent = courseNames[input.value]
    row.appendChild(td)
}



