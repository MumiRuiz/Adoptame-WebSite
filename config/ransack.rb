
# Ransack.configure do |config|
#     config.add_predicate 'special_match', # Name your predicate
#         arel_predicate: 'matches',
#         formatter: proc { |s| transliterate(s) },
#         validator: proc { |s| s.present? },
#         compounds: true,
#         type: :string
# end