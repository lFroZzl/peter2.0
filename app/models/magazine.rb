class Magazine < ApplicationRecord

    has_many :magazineoenologistjobtitles

    has_many :job_titles, through: :magazineoenologistjobtitles
    has_many :oenologists, through: :magazineoenologistjobtitles

    def to_s
        return self.name
    end

    def addJobTitlesAndOenologists(oenologist_id_list)
        self.magazineoenologistjobtitles.destroy_all
        # "1"=>{"job_title_ids"=>["1", "2", "3"]}, "3"=>{"job_title_ids"=>["3"]}
        oenologist_id_list.each do |oenologist_id, job_title_ids|
            oenologist = Oenologist.find(oenologist_id)
            job_title_ids[:job_title_ids].each do |job_title_id|
                job_title = JobTitle.find(job_title_id)
                magazineoenologistjobtitles = Magazineoenologistjobtitle.new
                magazineoenologistjobtitles.magazine_id = self.id
                magazineoenologistjobtitles.oenologist_id = oenologist.id
                magazineoenologistjobtitles.job_title_id = job_title.id
                magazineoenologistjobtitles.save
            end
        end
    end

    def isOenologistThisJobTitle(o_id, jt_id)
        magazineoenologistjobtitles = Magazineoenologistjobtitle.where(magazine_id: self.id, oenologist_id: o_id, job_title_id: jt_id)
        if magazineoenologistjobtitles.count == 1
            return "checked"
        end
    end
end
