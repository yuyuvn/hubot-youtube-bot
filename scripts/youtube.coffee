# Description:
#   Spam meo
#
# Dependencies:
#
# Configuration:
#
# Commands:
#
# Author:
#   clicia scarlet <yuyuvn@icloud.com>
CronJob = require('hubot-cronjob')

module.exports = (robot) ->
  replied = []
  robot.catchAll (msg) ->
    return if msg.envelope.user.id in replied
    replied.push msg.envelope.user.id
    message = robot.brain.data.youtube?.message
    msg.reply message if message?

  new CronJob "* * 7 * * *", "Asia/Bangkok", () -> replied = []
