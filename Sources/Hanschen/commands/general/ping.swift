import Sword

var pingMeta = CommandOptions(
	aliases: ["pong"],
	description: "Pong!")

extension Shield {
	func addPingCmd() {
		self.register("ping", with: pingMeta) { msg, args in
			// Function
			
			
			// Reply
			var em = Embed.init()
			em.title = "Ping?"
			em.description = "Pong!"
			msg.reply(with: em)
		}
	}
}
