import Sword

var kickMeta = CommandOptions(
	aliases: ["boot"],
	description: "Kicks a member from the guild")

extension Shield {
	func addKickCmd() {
		self.register("kick", with: kickMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Kick"

			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
				em.description = "Sorry, you don't have the required permission: `KICK_MEMBERS`";
				return
			}
			
			// Make sure there was a highlight and fetch the appropriate member
			guard !args.isEmpty, let targetUser = msg.mentions.first else {
				em.description = "Usage: .kick <@user> <reason>";
				msg.reply(with: em);
				return
			}
			
			// Drop the mention from the args
			let newArgs = args.dropFirst()
			
			// Get the reason message ready to go
			let reason = newArgs.joined(separator: " ")
			
			// Get the guild that the message came from
			guard let guild = client.getGuild(for: msg.channel.id) else {
				return
			}
			guild.kick(targetUser.id, for: reason)
			em.description = "Successfully kick <@\(targetUser.id)> because: \(reason)"
			msg.reply(with: em)
		}
	}
}
