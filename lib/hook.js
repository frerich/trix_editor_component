import Trix from "../assets/node_modules/trix/dist/trix.umd.min.js"

export default TrixEditorHook = {
    updated() {
        let trixEditor = document.querySelector("trix-editor")

        if (trixEditor !== null) {
            trixEditor.editor.loadHTML(this.el.value);
        }
    }
}
