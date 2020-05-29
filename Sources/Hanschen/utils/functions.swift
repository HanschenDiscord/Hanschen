import Sword
import Foundation

extension Sword {
	var totalMemberCount: Int {
		return self.guilds.values.reduce(0) { $0 + ($1.memberCount ?? 0) }
	}
	var totalChannelCount: Int {
		return self.guilds.values.reduce(0) { $0 + ($1.channels.count ?? 0) }
	}
	var totalAllGuilds: Int {
		let total = self.guilds.count + self.unavailableGuilds.count
		return total
	}
	func postStatsBoats() {
		let url = URL(string: "https://discord.boats/api/bot/{bot.id}")
		guard let requestUrl = url else { fatalError() }
		
		var request = URLRequest(url: requestUrl)
		request.httpMethod = "POST"
		request.setValue("API_KEY", forHTTPHeaderField: "Authorization")
		let postString = "server_count=\(self.totalAllGuilds)";
		request.httpBody = postString.data(using: String.Encoding.utf8);
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let error = error {
				print("Error took place \(error)")
				return
			}
			if let data = data, let dataString = String(data: data, encoding: .utf8) {
				print("Response data string:\n \(dataString)")
				
			}
		}
		task.resume()
	}
	func postStatsTopDotGeeGee() {
		let url = URL(string: "https://top.gg/api/bots/{bot.id}/stats")
		guard let requestUrl = url else { fatalError() }
		
		var request = URLRequest(url: requestUrl)
		request.httpMethod = "POST"
		request.setValue("API_KEY", forHTTPHeaderField: "Authorization")
		let postString = "server_count=\(self.totalAllGuilds)";
		request.httpBody = postString.data(using: String.Encoding.utf8);
		let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
			if let error = error {
				print("Error took place \(error)")
				return
			}
			if let data = data, let dataString = String(data: data, encoding: .utf8) {
				print("Response data string:\n \(dataString)")
				
			}
		}
		task.resume()
	}
}
