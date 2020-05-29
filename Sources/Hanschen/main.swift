import Sword
import Foundation

let options = ShieldOptions(prefixes: ["@bot", "h!"], willBeCaseSensitive: false, willDefaultHelp: true, willIgnoreBots: true)

// Token options: devToken for Hanschen Edge and proToken for Hanschen (Production)
let client = Shield(token: Config().token!, shieldOptions: options)

//events
client.addReadyEvent()
client.addMessageCreateEvent()
client.addGuildCreateEvent()
client.addGuildDeleteEvent()

//commands
client.addInfoCmd()
client.addPingCmd()
client.addBanCmd()
client.addKickCmd()
client.addMuteCmd()
client.addPruneCmd()
client.addShardInfoCmd()
//client.addPardonCmd()
client.addInviteCmd()
client.addUnmuteCmd()
client.addUnbanCmd()

client.connect()

