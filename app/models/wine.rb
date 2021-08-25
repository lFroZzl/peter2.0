class Wine < ApplicationRecord
    has_many :wine_strains, dependent: :destroy
    has_many :strains, through: :wine_strains, dependent: :destroy


    def addStrainPercent(strainPercents)
        strainPercents.each do |strainId, strainPercentage|
            if strainPercentage != ""
                self.wine_strains.create(strain_id: strainId, percentage: strainPercentage)
            end
        end
    end

    def getPercentByStrain(strainId)
        self.wine_strains.find_by(strain_id: strainId).percentage
    end

    #def updateStrainPercent(strainPercents)
    #    strainPercents.each do |strainId, strainPercentage|
    #        if strainPercentage != ""
    #            self.wine_strains.create(strain_id: strainId, percentage: strainPercentage)
    #        end
    #    end
    #end
end