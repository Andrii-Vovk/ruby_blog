class ArticlePolicy < ApplicationPolicy
    def index?
        true
    end

    def archived?
        user_logged_in?
    end
    
    def show?
        if record.status == 'public'
            return true
        end

        author? || admin?
    end
    
    def update?
        author? || admin?
    end

    def destroy?
        author? || admin?
    end

    def create?
        true
    end

    private 

    def author?
        return false unless user
        record.author_id == user.id
    end
end