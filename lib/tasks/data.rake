namespace :data do
  desc "Courses seeds"
  task courses: :environment do
    Course.create(
      name: 'Методы онтологического инжиниринга',
      description: 'В рамках данного курса слушатели знакомятся с понятием семантики и её присутствием в повседневной жизни человека, и тем как научить «машины» понимать семантику, присутствующую в информации (тексты, веб-страницы и т.д.), которую человек создает и которой обменивается.',
      link: 'http://ipm.ifmo.ru/moe/',
      teacher: 'http://lod.ifmo.ru/page/Person145348'
    )
    Course.create(
      name: 'Алгоритмы программирования и структуры данных',
      description: 'Курс знакомит слушателей с базовыми структурами данных и алгоритмами, знание которых необходимо для эффективного решения разнообразных задач программирования.',
      link: 'https://courses.ifmo.ru/courses/ITMO/x1006.00/spring_2016/about',
      teacher: 'http://lod.ifmo.ru/page/Person138334'
    )

    Course.create(
      name: 'Геометрическая оптика',
      description: 'Многоуровневый интерактивный онлайн-курс «Геометрическая оптика» является основополагающим для дальнейшего обучения и профессиональной деятельности в области оптической инженерии.',
      link: 'https://courses.ifmo.ru/courses/course-v1:ITMO+x1008.00+spring_2016/about',
      teacher: 'http://lod.ifmo.ru/page/Person110941'
    )

    Course.create(
      name: 'Информационные устройства и системы в приборостроении и мехатронике',
      description: 'Курс ориентирован на приобретение систематизированных сведений об информационных устройствах и системах: общие вопросы об информации, способы её получения и обработки.',
      link: 'https://courses.ifmo.ru/courses/course-v1:ITMO+x1009.00+spring_2016/about',
      teacher: 'http://lod.ifmo.ru/page/Person100141'
    )

    Course.create(
      name: 'Основы лазерной техники',
      description: 'В предлагаемом курсе изучаются основные принципы генерации и усиления лазерного излучения, а также оптотехника твердотельных лазерных систем.',
      link: 'https://courses.ifmo.ru/courses/course-v1:ITMO+x1010.00+spring_2016/about',
      teacher: 'http://lod.ifmo.ru/page/Person100418'
    )
  end

end
