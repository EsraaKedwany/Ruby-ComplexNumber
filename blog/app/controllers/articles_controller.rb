class ArticlesController < ApplicationController

    # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    load_and_authorize_resource
    
    def index
        @articles = Article.all
        @user = current_user
    end

    def show
        @article = Article.find(params[:id])
        # @user = Article.user
        # @user = current_user

    end

    def new
        @article = Article.new # <--------------
    end

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(article_params.merge(user_id: current_user.id))
        puts current_user.id
        # @article.user.id
        if @article.save
            redirect_to @article #redirect data to show
        else
            render 'new'
        end

    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params) # <---not necessary in update ?!
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

end
