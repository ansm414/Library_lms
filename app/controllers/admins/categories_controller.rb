class Admins::CategoriesController < ApplicationController
    before_action :setid, only:[:show, :edit, :destroy,:update]
    def index
        @q=Category.ransack(params[:q])
        @categories=@q.result(distinct: true).page(params[:page])
        authorize([:Admin,@categories])
    end

    def show
        authorize([:Admin,@category])
    end

    def new 
        @category= Category.new
        authorize([:Admin,@category])
    end

    def create
        @category= Category.new(category_params)
        authorize([:Admin,@category])
        if @category.save
            redirect_to admins_categories_path, notice: t("new_categories_created")
        else
            render :new
        end
    end

    def edit
        authorize([:Admin,@category])
    end

    def update
        authorize([:Admin,@category])
        if @category.update(category_params)
            redirect_to admins_categories_path, notice: t("update_category")
        else
            render :edit
        end
    end

    def destroy
        authorize([:Admin,@category])
        if @category.destroy
            redirect_to admins_categories_path,alert: t("category_destroyed"), status: 303
        else
         
        end
    end

    private
    
        def category_params
            params.require(:category).permit(:name);
        end

        def setid
            @category=Category.find(params[:id])
        end

end
