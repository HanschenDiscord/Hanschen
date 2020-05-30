import Sword
import Foundation

let options = ShieldOptions(prefixes: ["@bot", "h!"], willBeCaseSensitive: false, willDefaultHelp: true, willIgnoreBots: true)

let client = Shield(token: Config().token!, shieldOptions: options)

// Events:
client.addReadyEvent()
client.addMessageCreateEvent()
client.addGuildCreateEvent()
client.addGuildDeleteEvent()

// Commands:
// > General
client.addInfoCmd()
client.addPingCmd()
client.addShardInfoCmd()
client.addInviteCmd()

// > Moderation
client.addBanCmd()
client.addKickCmd()
client.addMuteCmd()
client.addPruneCmd()
client.addUnmuteCmd()
client.addUnbanCmd()

// > Misc

// > NSFW

client.connect()

