import Sword

var shardInfoMeta = CommandOptions(
	aliases: ["shinfo", "sinfo"],
	description: "Shows you the current shard information")

extension Shield {
	func addShardInfoCmd() {
		self.register("shardinfo", with: shardInfoMeta) { msg, args in
			// Function
			var message = "```prolog\n"
			message += "Shards          => \(client.shardCount)\n"
			message += "```"
			
			// Reply
			var em = Embed.init()
			em.title = "Shard information"
			em.description = "\(message)"
			msg.reply(with: em)
		}
	}
}

