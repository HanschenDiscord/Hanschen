import Sword

var muteMeta = CommandOptions(
	aliases: ["silence"],
	description: "Mutes the member from chatting")
var unmuteMeta = CommandOptions(
	aliases: ["silence"],
	description: "Unmutes the member from chatting")

extension Shield {
	func addMuteCmd() {
		self.register("mute", with: muteMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Mute"
			
			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
					em.description = "Sorry, you don't have the required permission: `MANAGE_ROLES`";
					return
			}
			
			// Make sure there was a highlight and fetch the appropriate member
			guard !args.isEmpty, let targetUser = msg.mentions.first else {
				em.description = "Usage: .mute <@user> <reason>";
				msg.reply(with: em);
				return
			}
			
			// Drop the mention from the args
			let newArgs = args.dropFirst()
			
			// Get the reason message ready to go
			let reason = newArgs.joined(separator: " ")
			
			// Get the guild that the message came from
			guard let guild = client.getGuild(for: msg.channel.id), let targetMember = guild.members[targetUser.id] else {
					return
			}
			
			// Make sure there is a role called "muted"
			guard let mutedRole = guild.roles.values.first(where: {
					role in role.name.lowercased() == "muted"
				}) else {
					em.description = "Sorry, I couldn't find a role named `muted`. Please create the required role and try again!";
					msg.reply(with: em);
					return
			}
			
			// Duplicate a new array and append the mutedRole
			var targetRoleIds = targetMember.roles.map { $0.id.rawValue }
			targetRoleIds.append(mutedRole.id.rawValue)

			// Apply the role "muted" to the targetUser:
			guild.modifyMember(targetUser.id, with: ["roles": targetRoleIds])
			
			em.description = "Successfully muted <@\(targetUser.id)> because: \(reason)"
			msg.reply(with: em)
		}
	}
	func addUnmuteCmd() {
		self.register("unmute", with: unmuteMeta) { msg, args in
			// Function
			var em = Embed.init()
			em.title = "Unmute"

			// Check that the caller has the appropriate permissions
			guard let member = msg.member, member.hasPermission(.manageMessages) else {
				em.description = "Sorry, you don't have the required permission: `MANAGE_ROLES`";
				return
			}

			// Make sure there was a highlight and fetch the appropriate member
			guard !args.isEmpty, let targetUser = msg.mentions.first else {
				em.description = "Usage: .unmute <@user> <reason>";
				msg.reply(with: em);
				return
			}

			// Drop the mention from the args
			let newArgs = args.dropFirst()

			// Get the reason message ready to go
			let reason = newArgs.joined(separator: " ")

			// Get the guild that the message came from
			guard let guild = client.getGuild(for: msg.channel.id), let targetMember = guild.members[targetUser.id] else {
				return
			}

			// Make sure there is a role called "muted"
			guard let mutedRole = guild.roles.values.first(where: {
				role in role.name.lowercased() == "muted"
			}) else {
				em.description = "Sorry, I couldn't find a role named `muted`. Please create the required role and try again!";
				msg.reply(with: em);
				return
			}

			// Duplicate a new array and append the mutedRole
			var targetRoleIds = targetMember.roles.map { $0.id.rawValue }
			// Find the mutedRole from the Member role and pop it from the array
			if let index = targetRoleIds.index(of: mutedRole.id.rawValue) {
				targetRoleIds.remove(at: index)
			}

			// Apply the role "muted" to the targetUser:
			guild.modifyMember(targetUser.id, with: ["roles": targetRoleIds])

			em.description = "Successfully unmuted <@\(targetUser.id)> because: \(reason)"
			msg.reply(with: em)
		}
	}
}
