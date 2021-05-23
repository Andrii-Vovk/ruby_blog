class CommentPolicy < ApplicationPolicy

    def destroy?
        comment_author? || admin?
    end

    def create?
        true
    end

    private 

    def comment_author?
        return false unless user
        record.author_id == user.id
    end
end