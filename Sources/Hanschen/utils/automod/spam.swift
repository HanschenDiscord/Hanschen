//import Foundation
//import Sword
//
//extension Shield {
//	func addAutoModSpam() {
//		client.on(.messageCreate) { data in
//			let msg = data as! Message
//			
//			msg.channel.getMessages(with: ["limit" : 5], then: { messages, error in
//				guard let messages = messages else {
//					print(error!)
//					return
//				}
//				let messagesMap = messages.map{ $0 }
//				var count : Int
//				for index in messagesMap {
//					print(index) // this prints the last 5 messages' timestamps.
//					if index.timestamp <= 5 seconds { // is the timestamp equal to or less than 5 seconds
//						// return true
//						count += 1
//						else {
//							// return false
//						}
//				}
//			)
//		}
//	}
//}
