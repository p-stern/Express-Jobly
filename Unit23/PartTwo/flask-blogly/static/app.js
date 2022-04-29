function getOrPost(el, id) {
    const form = document.getElementById("userDetailForm");
    if (el.id === "Edit") {
        document.getElementById("userDetailForm").setAttribute("method", 'GET');
        form.attributes.action.value = `/users/${id}/edit`;
    }
    else {
        document.getElementById("userDetailForm").setAttribute("method", 'POST');
        form.attributes.action.value = `/users/${id}/delete`;
    }
}

function getOrPost2(el, id) {
    const form = document.getElementById("postDetailForm");
    if (el.id === "Cancel") {
        document.getElementById("postDetailForm").setAttribute("method", 'GET');
        form.attributes.action.value = `/posts/${id}/edit`;
    }
    else {
        if (el.id === "Edit") {
            document.getElementById("postDetailForm").setAttribute("method", 'GET');
            form.attributes.action.value = `/posts/${id}/edit`;
        }
        else {
            document.getElementById("postDetailForm").setAttribute("method", 'POST');
            form.attributes.action.value = `/posts/${id}/delete`;
        }
    }
};