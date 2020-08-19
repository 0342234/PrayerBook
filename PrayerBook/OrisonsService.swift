//
//  OrisonsService.swift
//  PrayerBook
//
//  Created by Yaroslav Bosenko on 23.07.2020.
//  Copyright © 2020 none-org. All rights reserved.
//

import Foundation

class OrisonsService {
    
    func getOrisons(completion: @escaping ([OrisonsSection]) -> Void) {
        let orison1 = Orison(id: UUID.init(),
                             text: "Зна́менуй себя крестом и говори молитву Честно́му Кресту: \nДа воскре́снет Бог, и расточа́тся врази́ Его́, и да бежа́т от лица́ Его́ ненави́дящии Его́. Я́ко исчеза́ет дым, да исче́знут; я́ко та́ет воск от лица́ огня́, та́ко да поги́бнут бе́си от лица́ лю́бящих Бо́га и зна́менующихся кре́стным зна́мением, и в весе́лии глаго́лющих: ра́дуйся, Пречестны́й и Животворя́щий Кре́сте Госпо́день, прогоня́яй бе́сы си́лою на тебе́ пропя́таго Го́спода на́шего Иису́са Христа́, во ад сше́дшаго и попра́вшего си́лу диа́волю, и дарова́вшаго нам тебе́ Крест Свой Честны́й на прогна́ние вся́каго супоста́та. О, Пречестны́й и Животворя́щий Кре́сте Госпо́день! Помога́й ми со Свято́ю Госпоже́ю Де́вою Богоро́дицею и со все́ми святы́ми во ве́ки. Ами́нь." ,
                             title: "Бла бла бла бла бла бла бла бла бла бла бла",
                             shortText: "Огради́ мя, Го́споди, си́лою Честна́го и Животворя́щаго Твоего́ Креста́, и сохра́ни мя от вся́каго зла.")
        
        
        let orison10 = Orison(id: UUID.init(),
                              text: "Зна́менуй себя крестом и говори молитву Честно́му Кресту: \nДа воскре́снет Бог, и расточа́тся врази́ Его́, и да бежа́т от лица́ Его́ ненави́дящии Его́. Я́ко исчеза́ет дым, да исче́знут; я́ко та́ет воск от лица́ огня́, та́ко да поги́бнут бе́си от лица́ лю́бящих Бо́га и зна́менующихся кре́стным зна́мением, и в весе́лии глаго́лющих: ра́дуйся, Пречестны́й и Животворя́щий Кре́сте Госпо́день, прогоня́яй бе́сы си́лою на тебе́ пропя́таго Го́спода на́шего Иису́са Христа́, во ад сше́дшаго и попра́вшего си́лу диа́волю, и дарова́вшаго нам тебе́ Крест Свой Честны́й на прогна́ние вся́каго супоста́та. О, Пречестны́й и Животворя́щий Кре́сте Госпо́день! Помога́й ми со Свято́ю Госпоже́ю Де́вою Богоро́дицею и со все́ми святы́ми во ве́ки. Ами́нь." ,
                              title: "Молитва Честно́му Кресту (Да воскреснет Бог...)",
                              shortText: "Огради́ мя, Го́споди, си́лою Честна́го и Животворя́щаго Твоего́ Креста́, и сохра́ни мя от вся́каго зла.")
        
        
        let orisons = [orison1,orison10,orison1,orison10,orison1,orison10,orison1,orison10,orison1,orison10,orison1,orison10,orison1,orison10,orison1,orison10]
        
        let section1 = OrisonsSection(title: "Секция Дзюдо",
                                      id: 1,
                                      orisosns: orisons)
        
        let section2 = OrisonsSection(title: "Cекция Молитв",
                                      id: 2,
                                      orisosns: orisons)
        
        
        completion([section1, section2])
    }
}
