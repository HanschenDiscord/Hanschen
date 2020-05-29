import Foundation
import Sword

extension Shield {
	func addReadyEvent() {
		client.on(.ready) { data in
			let user = data as! User
			var log = "[CLIENT: INFO] Launching instance\n"
			log += "[CLIENT: INFO] Identifier: \(user.id)\n"
			log += "[CLIENT: INFO] Tag: \(user.username!)#\(user.discriminator!)\n"
			log += "[CLIENT: INFO] Is it a bot?: \(user.isBot!)\n"
			log += "[CLIENT: INFO] Invite link: https://discord.com/oauth2/authorize?client_id=\(user.id)&scope=bot\n"
			log += "[CLIENT: INFO] Instance is now ready!"
			print(log)
		}
	}
}
