import { Controller } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"

export default class extends Controller {
    static targets = ["input", "label"]

    connect() {
        this.labelTarget.textContent = this.defaultText
    }

    click() {
        this.inputTarget.click()
    }

    dragover(event) {
        event.preventDefault()
        this.element.classList.add("dragover")
    }

    dragleave(event) {
        event.preventDefault()
        this.element.classList.remove("dragover")
    }

    drop(event) {
        event.preventDefault()
        this.element.classList.remove("dragover")
        if (event.dataTransfer.files.length > 0) {
            this.inputTarget.files = event.dataTransfer.files
            this._updateLabel()
        }
    }

    change() {
        this._updateLabel()
    }

    // private

    get defaultText() {
        return "Drag & drop file here or click to upload (.pdf, .docx, .txt)"
    }

    _updateLabel() {
        const files = Array.from(this.inputTarget.files).map(f => f.name)
        this.labelTarget.textContent = files.join(", ")
    }
}