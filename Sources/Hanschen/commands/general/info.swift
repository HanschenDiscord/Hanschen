import Sword

var infoMeta = CommandOptions(
	aliases: ["info", "i", "about"],
	description: "Shows you bot information.")

extension Shield {
	func addInfoCmd() {
		self.register("info", with: infoMeta) { msg, args in
			// Function
			var message = "```prolog\n"
			message += "Guilds              => \(client.totalAllGuilds)\n"
			message += "Users               => \(client.totalMemberCount)\n"
			message += "Channels            => \(client.totalChannelCount)\n"
			message += "Uptime              => \(client.uptime!)s\n"
			message += "Commands            => \(client.commands.count)\n"
			message += "Library             => Sword latest\n"
			message += "Swift Version       => Swift 5.2\n"
			message += "```"
			
			// Reply
			var em = Embed.init()
			em.title = "Information"
			em.description = "\(message)"
			msg.reply(with: em)
		}
	}
}
