import Sword

var banMeta = CommandOptions(
	aliases: ["bean"],
	description: "Bans a member from the guild")

var unbanMeta = CommandOptions(
	aliases: ["unbean"],
	description: "Unbans a member from the guild")

extension Shield {
	func addBanCmd() {
		self.register("ban", with: banMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Ban"

			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
				em.description = "Sorry, you don't have the required permission: `BAN_MEMBERS`";
				return
			}
			
			// Make sure there was a highlight and fetch the appropriate member
			guard !args.isEmpty, let targetUser = msg.mentions.first else {
				em.description = "Usage: .ban <@user> <reason>";
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
			guild.ban(targetUser.id, for: reason)
			em.description = "Successfully banned <@\(targetUser.id)> because: \(reason)"
			msg.reply(with: em)
		}
	}
	func addUnbanCmd() {
		self.register("unban", with: unbanMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Unban"
			
			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
				em.description = "Sorry, you don't have the required permission: `BAN_MEMBERS`";
				return
			}
			
			// Make sure there was a highlight and fetch the appropriate member
			guard !args.isEmpty, let targetUser = msg.mentions.first else {
				em.description = "Usage: .unban <@user> <reason>";
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
			guild.unbanMember(targetUser.id)
			em.description = "Successfully unbanned <@\(targetUser.id)> because: \(reason)"
			msg.reply(with: em)
		}
	}
}
