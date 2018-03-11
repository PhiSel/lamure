#include <lamure/vt/ooc/TileRequest.h>

namespace vt{
    namespace ooc{
        TileRequest::TileRequest() : PriorityHeapContent<uint32_t>(), seb::Observable() {
            _resource = nullptr;
        }

        void TileRequest::setResource(AtlasFile *resource){
            _resource = resource;
        }

        AtlasFile *TileRequest::getResource(){
            return _resource;
        }

        void TileRequest::setId(uint64_t id){
            _id = id;
        }

        uint64_t TileRequest::getId(){
            return _id;
        }

        void TileRequest::erase(){
            this->inform(0);
        }
    }
}