// const table = document.querySelector("table");


// table.addEventListener("click", event =>{
//     if(event.target.tagName === "A"){
//         if(!confirm("Are you sure sure?")){
//             return false;
//         } else {
//             const getId = event.target.getAttribute("href").slice(-1);
//             fetch(`http://localhost:8080/instructors/${getId}`, {method: "DELETE"});
//         }
//     }
// });