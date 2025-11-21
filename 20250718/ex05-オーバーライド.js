class Notification {
  constructor(message) {
    this.message = message;
  }

send() {
    return `通知: ${this.message}`;
  }
}

class EmailNotification extends Notification {
  send() {
  return `${super.send()}\nメールで送信しました`;
  }
}

class SlackNotification extends Notification {
  send() {
  return `${super.send()}\nSlackで通知しました`;
  }
}

const email = new EmailNotification("明日の会議があります");
const slack = new SlackNotification("新しいタスクがあります");

console.log(email.send());
console.log(slack.send())

/*
出力結果↓
通知: 明日の会議があります
メールで送信しました
通知: 新しいタスクがあります
Slackで通知しました
*/

