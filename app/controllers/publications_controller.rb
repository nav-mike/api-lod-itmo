class PublicationsController < ApplicationController
  def projects
    respond_to do |format|
      format.html { redirect_to 'https://rus-lod.herokuapp.com/apis' }
      format.json do
        @publications = [
          {
            title: 'Ermilov, I., Höffner, K., Lehmann, J., Mouromtsev, D. kOre: Using Linked Data for OpenScience Information Integration, SEMANTiCS 2015, (2015)',
            link: 'https://goo.gl/6gNhqd'
          },
          {
            title: 'Муромцев Д.И., Леманн Й., Семерханов И.А., Навроцкий М.А., Ермилов И.С. Исследование актуальных способов публикации открытых научных данных в сети // Научно-технический вестник информационных технологий, механики и оптики. 2015. Том 15. № 6. С. 1081–1087.',
            link: 'https://goo.gl/wBhqBJ'
          },
          {
            title: 'Navrotskiy M., Zhukova N. Scientific portal of university department-shaping research area of users through their behavior // CEUR Workshop Proceedings - 2016, Vol. 1627, pp. 101-110',
            link: 'https://goo.gl/jYdM3Z'
          },
          {
            title: 'Радченко И. А., Навроцкий М. А. Связанные открытые данные в университете // Linux Vacation / Eastern Europe 2016 (LVEE)',
            link: 'https://goo.gl/mKEbU8'
          },
          {
            title: 'Karmanovskiy N., Mouromtsev D., Navrotskiy M., Pavlov D., Radchenko I. A Case Study of Open Science Concept: Linked Open Data in University // DTGS 2016 - 2016, Vol. 674',
            link: false
          }
        ]
        @publications = [] unless project_id.to_i == 1
      end
    end
  rescue => e
    render json: {message: e.message}, status: :internal_server_error
  end
end
