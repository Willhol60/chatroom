import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]
  connect() {
      this.channel = createConsumer().subscriptions.create({
          channel: "ChatroomChannel", id: this.chatroomIdValue
      }, {
          received: data => this.insertOrDeleteMessage(data)
      })
  }

  insertOrDeleteMessage(data) {
    if (data.startsWith('delete')) {
        document.getElementById(data.split('-')[1]).remove()
    } else {
        this.messagesTarget.insertAdjacentHTML("beforeend", data)
    }
  }

  resetForm(event) {
      event.target.reset()
  }

  disconnect() {
      this.channel.unsubscribe()
  }
}