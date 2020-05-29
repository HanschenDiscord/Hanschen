import Sword
import Foundation

var pruneMeta = CommandOptions(
	aliases: ["clear"],
	description: "Clears the channel's last x messages")

extension Shield {
	func addPruneCmd() {
		self.register("prune", with: pruneMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Prune"
			
			// Highlight the targetBot
			guard let guild = client.getGuild(for: msg.channel.id), let targetBot = guild.members[(client.user?.id)!] else {
				return
			}
			
			// Check that the bot has the appropaite permission to execute this command
			guard targetBot.hasPermission(.manageMessages) else {
				em.description = "Sorry, I don't have the permission: `MANAGE_MESSAGES`.";
				msg.reply(with: em);
				return
			}
			
			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
				em.description = "Sorry, you don't have the required permission: `MANAGE_ROLES`";
				return
			}
			
			// Make sure there was a highlight,
			guard !args.isEmpty else {
				em.description = "Usage: .prune <number>";
				msg.reply(with: em);
				return
			}
			
			let newArgs = args.first
			let pruneCount = Int((newArgs)!)!
			
			msg.channel.getMessages(with: ["limit" : pruneCount], then: { messages, error in
				guard let messages = messages else {
					print(error!)
					return
				}
				let delMessages = messages.map { $0.id}
				
				msg.channel.deleteMessages(delMessages)
				em.description = "Successfully pruned `\(pruneCount)` messages from this channel!"
				msg.reply(with: em, then: { message, error in
					guard let reply = message else {
						print(error!)
						return
					}
					DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
						reply.delete()
					}
				})
			})
		}
	}
}

