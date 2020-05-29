import Foundation
import Sword

extension Shield {
	func addMessageCreateEvent() {
		client.on(.messageCreate) { data in
			let msg = data as! Message
			
//			// Get the guild that the message came from
//			guard let guild = client.getGuild(for: msg.channel.id) else {
//				return
//			}
		}
	}
}
