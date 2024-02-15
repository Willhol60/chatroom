import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  connect() {
      this.channel = createConsumer().subscriptions.create({
          channel: "ChatroomChannel"
      }, {
          received: data => this.insertMessage(data)
      })
  }

  insertMessage(data) {
      this.messagesTarget.insertAdjacentHTML("beforeend", data)
  }

  resetForm(event) {
      event.target.reset()
  }

  disconnect() {
      this.channel.unsubscribe()
  }
}