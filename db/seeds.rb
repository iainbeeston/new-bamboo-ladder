INITIAL_LADDER = <<EOL
tom
samuel
ismael
mark
olly
ben
oliver.n
laurie
dan
claudio
vivien
tony
gwyn
oscar
joe
niall
pablo
lee
EOL

User.update_all(ladder_rank: nil)
INITIAL_LADDER.split.each_with_index do |name, i|
  user = User.where(email: "#{name}@new-bamboo.co.uk").first_or_initialize
  user.name ||= name.humanize
  user.ladder_rank = i
  pp user
  user.save!
end
