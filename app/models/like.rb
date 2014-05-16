class Like < Socialization::ActiveRecordStores::Like
  belongs_to :album
  belongs_to :update
  belongs_to :comment
  belongs_to :video
end
