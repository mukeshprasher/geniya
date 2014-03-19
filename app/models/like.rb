class Like < Socialization::ActiveRecordStores::Like
  belongs_to :album
  belongs_to :update
  belongs_to :comment
end
