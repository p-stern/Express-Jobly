function getOrPost(el, id) {
    const form = document.getElementById("userDetailForm");
    if (el.id === "Edit") {
        document.getElementById("userDetailForm").setAttribute("method", 'GET');
        form.attributes.action.value = `/users/${id}/edit`;
    }
    else {
        document.getElementById("userDetailForm").setAttribute("method", 'POST');
        form.attributes.action.value = `/users/${id}/delete`;
    };
} 