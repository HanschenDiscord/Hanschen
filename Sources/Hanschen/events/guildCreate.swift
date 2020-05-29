import Foundation
import Sword

extension Shield {
	func addGuildCreateEvent() {
		client.on(.guildCreate) { data in
			let guild = data as! Guild
			print("Bot joined \(guild.name)")
			//client.postStatsBoats()
			//client.postStatsTopDotGeeGee()
		}
	}
}
