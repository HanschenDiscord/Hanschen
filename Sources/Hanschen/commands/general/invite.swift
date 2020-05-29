import Sword

var inviteMeta = CommandOptions(
	aliases: ["inv"],
	description: "Invite the bot to your guild!")

extension Shield {
	func addInviteCmd() {
		self.register("invite", with: inviteMeta) { msg, args in
			// Function
			
			
			// Reply
			var em = Embed.init()
			em.title = "Invite \(String(describing: client.user?.username!)) to your guild"
			em.description = "[Invite Link](https://discord.com/oauth2/authorize?client_id=\(client.user!.id)&scope=bot)"
			msg.reply(with: em)
		}
	}
}

