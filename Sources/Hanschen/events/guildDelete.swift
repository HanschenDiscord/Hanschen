import Foundation
import Sword

extension Shield {
	func addGuildDeleteEvent() {
		client.on(.guildDelete) { data in
			let guild = data as! Guild
			print("Bot left \(guild.name)")
		}
	}
}
