class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  belongs_to :category
  belongs_to :sub_category
  has_many :job_skills
  has_many :skills, through: :job_skills  

  has_attached_file :cover, :styles => { :large => "600x600>", :medium => "300x300>", :small => "100x100>" }, :default_url => "/assets/missing.png", :hash_secret => "geniyaAttach", :path => ":rails_root/public/system/jobs/:id_:style.:extension", :url => "/system/jobs/:id_:style.:extension",
                        :storage        => :s3                                                 ,
                      :s3_credentials => {:bucket            => 'geniyanet',
                                          :access_key_id     => 'AKIAIUP2GZ5XEI6BZW3A',
                                          :secret_access_key => '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'},
                      :s3_protocol    => "http"                                             ,
                      :bucket => "geniyanet"
  crop_attached_file :cover , :aspect => "600:600"
  validates_attachment :cover, 
  :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 0..1000.kilobytes },
  :file_name => { :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/] }  
 
  validates_presence_of :organization_id
  validates_presence_of :category_id
  validates_presence_of :sub_category_id
  validates :title,  presence: true, length: { minimum: 10, maximum: 140 }
  validates :description,  presence: true, length: { minimum: 10, maximum: 250 }
  validates :skills_text,  presence: true
  
  
end
