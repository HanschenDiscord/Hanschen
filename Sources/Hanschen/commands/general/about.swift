import Sword

var aboutMeta = CommandOptions(
	aliases: ["who", "about"],
	description: "Tells you more information about Hänschen")

extension Shield {
	func addAboutCmd() {
		self.register("about", with: aboutMeta) { msg, args in
			// Function
			var message = "Hänschen is a moderation bot under heavy development. At the moment, it is basic but it will soon have more features, such as auto-moderation, cases, advanced logs, and more."
			
			// Reply
			var em = Embed.init()
			em.title = "About Hänschen"
			em.description = "\(message)"
			msg.reply(with: em)
		}
	}
}
